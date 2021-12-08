import 'package:cupboard/models/trademarks.dart';
import 'package:flutter/material.dart';

class TrademarkProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  late Trademark mark;

  TrademarkProvider(this.mark);

  bool _isLoading = false;
  
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return (formKey.currentState?.validate() ?? false);
  }
}
