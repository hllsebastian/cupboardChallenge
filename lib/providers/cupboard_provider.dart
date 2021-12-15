
import 'package:cupboard/models/cupboard_model.dart';
import 'package:flutter/material.dart';

class CupboardProvider extends ChangeNotifier{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late CupboardModel cupDetail;
  //late CupBoardReq cupModel;

  CupboardProvider(
    //this.cupModel,
    this.cupDetail,
  );

  updateIsDefault(bool value){
    //cupModel.isDefault = value;
    notifyListeners();
  }

  valueSelect(String value){
    cupDetail.idProduct = value;
    notifyListeners();
  }

  bool isValidForm(){
    /* print('desde el provider product ${cupModel.idProduct}');
    print('desde el provider amount ${cupModel.amount}');
    print('desde el provider entri ${cupModel.entryDate}');
    print('desde el provider exit ${cupModel.exitDate}');
    print('desde el provider expire ${cupModel.expirationDate}'); */
    return formKey.currentState?.validate() ?? false;
  }
}