import 'package:cupboard/models/trademark_model.dart';
import 'package:flutter/material.dart';

class TrademarkProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  
  late TrademarkModel mark;

  TrademarkProvider(this.mark);

/*   bool _isLoading = false;
  
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  } */

  bool isValidForm() {
    return (formKey.currentState?.validate() ?? false);
  }
}
