import 'dart:convert';
import 'package:cupboard/models/cupboard_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class CupboardService extends ChangeNotifier{
  
  final storage = const FlutterSecureStorage();
  final List<CupboardModel> cupboardList = [];
  late CupboardModel selectedCupboard;
  bool isloading = true;

  CupboardService(){
    getCupboard();
  }

  Future<List<CupboardModel>> getCupboard()async{
    notifyListeners();

    final url = Uri.parse('https://10.0.2.2:5001/api/CupboardDetails');
    final token = await storage.read(key: 'token');
      
    Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization' : 'Bearer $token'
    };
    http.Response resp = await http.get(url, headers: requestHeaders);

    final List<dynamic> cupboardMap = json.decode(resp.body);

    for (var value in cupboardMap) {
      final response = CupboardModel.fromMap(value);
      cupboardList.add(response);
    }

    isloading = false;
    notifyListeners();

    return cupboardList;
  }








}