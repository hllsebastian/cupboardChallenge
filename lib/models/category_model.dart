import 'dart:convert';

class CategoryModel {

    CategoryModel({
        this.idcategory,
        required this.name,
    });

    String? idcategory;
    String name;

    factory CategoryModel.fromJson(String str) => CategoryModel.fromMap(json.decode(str));

    factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        idcategory: json["idcategory"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
       // "idcategory": idcategory,
        "name": name,
    };

    CategoryModel update() => CategoryModel(
      idcategory: idcategory,
      name: name
    );
}
