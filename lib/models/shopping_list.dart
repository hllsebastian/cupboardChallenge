// To parse this JSON data, do
//
//     final shoppingList = shoppingListFromMap(jsonString);

import 'dart:convert';

class Product {
    Product({
      this.idProduct,
      this.idMark,
      required  this.nameProduct,
      required  this.expirationDate,
      this.barCode,
      this.shoppingLists,
    });

    String? idProduct;
    String? idMark;
    String nameProduct;
    DateTime expirationDate;
    String? barCode;
    List<ShoppingList>? shoppingLists;

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    //String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        idProduct: json["idProduct"],
        idMark: json["idMark"],
        nameProduct: json["nameProduct"],
        expirationDate: json["expirationDate"],
        barCode: json["barCode"],
        shoppingLists: List<ShoppingList>.from(json["shoppingLists"].map((x) => ShoppingList.fromMap(x))),
    );
/* 
    Map<String, dynamic> toMap() => {
        "idProduct": idProduct,
        "idMark": idMark,
        "nameProduct": nameProduct,
        "expirationDate": expirationDate == null ? null : expirationDate.toIso8601String(),
        "barCode": barCode,
        "shoppingLists": List<dynamic>.from(shoppingLists.map((x) => x.toMap())),
    }; */
}

class ShoppingList {
    ShoppingList({
      this.idShopping,
      this.idProduct,
      required  this.amount,
      required  this.value,
      required this.expirationDate,
      required this.product,
    });

    String? idShopping;
    String? idProduct;
    int amount;
    int value;
    DateTime expirationDate;
    Product product;

    factory ShoppingList.fromJson(String str) => ShoppingList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ShoppingList.fromMap(Map<String, dynamic> json) => ShoppingList(
        idShopping: json["idShopping"],
        idProduct: json["idProduct"],
        amount: json["amount"],
        value: json["value"],
        expirationDate: DateTime.parse(json["expirationDate"]),
        product: json["product"],
    );

    Map<String, dynamic> toMap() => {
        "idShopping": idShopping,
        "idProduct": idProduct,
        "amount": amount,
        "value": value,
        "expirationDate": expirationDate.toIso8601String(),
        //"product": product == null ? null : product.toMap(),
    };
}
