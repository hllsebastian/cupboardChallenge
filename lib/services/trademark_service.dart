import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:cupboard/models/trademarks.dart';


class TrademarkService extends ChangeNotifier {

  final storage = const FlutterSecureStorage();
  final List<Trademark> trademarkslist = [];
  late Trademark selectedTrademark;
  bool isLoading = true;
  bool isSaving = true;


  TrademarkService() {
    loadTrademarks();
  }

  Future<List<Trademark>> loadTrademarks() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://10.0.2.2:5001/api/Trademarks');
    final token = await storage.read(key: 'token');

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    http.Response resp = await http.get(url, headers: requestHeaders);

    final List<dynamic> trademarksMap = json.decode(resp.body);

    // ignore: avoid_function_literals_in_foreach_calls
    trademarksMap.forEach((mark) {
      final tempTrademark = Trademark.fromMap(mark);
      trademarkslist.add(tempTrademark);
    });

    isLoading = false;
    notifyListeners();
    return trademarkslist;
  }

  Future saveOrCreateMark(Trademark trademark) async {
      // creando
    isSaving = true;
    notifyListeners();
    if (trademark.idTrademark == null) {
      await createMark(trademark);
    } else {
      // Actualizando
      await updateMark(trademark);
    }
  }

  Future<String?> createMark(Trademark trademark) async {

    final url = Uri.parse('https://10.0.2.2:5001/api/Trademarks');
    final token = await storage.read(key: 'token');

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    
    http.Response resp = await http.post(url,
        headers: requestHeaders, body: jsonEncode(trademark.toJson()));
    final response = json.decode(resp.body);
    trademark.idTrademark = response['name'];

    trademarkslist.add(trademark);
    notifyListeners();

    return trademark.idTrademark;
  }


  Future<String?> updateMark(Trademark trademark) async {

    final url = Uri.parse('https://10.0.2.2:5001/api/Trademarks/${trademark.idTrademark}');
    final token = await storage.read(key: 'token');

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    
    await http.put(url, headers: requestHeaders, body: jsonEncode(trademark.toJson()));
    final index = trademarkslist.indexWhere((e) => e.idTrademark == trademark.idTrademark);
    trademarkslist[index] = trademark;

    notifyListeners();
    return trademark.idTrademark!;
  }

  Future<String> deleteTradeMark(String idTradeMark) async {

    final url = Uri.parse('https://10.0.2.2:5001/api/Trademarks/$idTradeMark');
    final token = await storage.read(key: 'token');

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    await http.delete(url, headers: requestHeaders);
    notifyListeners();
    trademarkslist.clear();
    loadTrademarks();
    return idTradeMark;
  }
}
