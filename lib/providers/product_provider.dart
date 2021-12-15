import 'package:cupboard/models/products_model.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late ProductsModel productModel;

  ProductProvider(this.productModel);

  valueSelected(String value){
    productModel.idMark = value;
    notifyListeners();
  }

  bool isValidForm(){
    return formKey.currentState?.validate() ?? false;
  } 
}