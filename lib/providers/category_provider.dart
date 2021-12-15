import 'package:cupboard/models/category_model.dart';
import 'package:flutter/material.dart';


class CategoryProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late CategoryModel categoryModel;

  CategoryProvider(this.categoryModel);

  bool isValidForm(){
    return formKey.currentState?.validate() ?? false;
  } 
}