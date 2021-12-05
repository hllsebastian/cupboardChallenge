import 'package:cupboard/models/trademarks.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class TrademarkService extends ChangeNotifier {

  final storage = FlutterSecureStorage();
  final List<Trademark> trademarkslist = [];
  late Trademark selectedTrademark;
  bool isLoading = true;


  TradeMarkService() {
    this.loadTrademarks();
  }

  Future<List<Trademark>> loadTrademarks() async {
    this.isLoading = true;
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

    trademarksMap.forEach((mark) {
      final tempTrademark = Trademark.fromMap(mark);

      this.trademarkslist.add(tempTrademark);
    });

    this.isLoading = false;
    notifyListeners();
    return this.trademarkslist;
  }

  Future saveOrCreateMark(Trademark trademark) async {
      // creando
    if (trademark.idTrademark == null) {
      await this.createMark(trademark);
    } else {
      // Actualizando
      await this.updateMark(trademark);
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

    final decodedData = json.decode(resp.body);

    trademark.idTrademark = decodedData['name'];

    this.trademarkslist.add(trademark);
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

    
    final resp = await http.put(url, headers: requestHeaders, body: jsonEncode(trademark.toJson()));

    final index = this.trademarkslist.indexWhere((e) => e.idTrademark == trademark.idTrademark);
    this.trademarkslist[index] = trademark;

    notifyListeners();

    return trademark.idTrademark!;
  }

  Future<String> deleteMark(String idTrademarks) async {
    final url = Uri.parse('https://10.0.2.2:5001/api/Trademarks/${idTrademarks}');

    final token = await storage.read(key: 'token');

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final resp = await http.delete(url, headers: requestHeaders);

    notifyListeners();
    trademarkslist.clear();
    loadTrademarks();
    return idTrademarks;
  }
}
