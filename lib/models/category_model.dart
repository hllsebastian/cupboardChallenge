import 'dart:convert';

class CategoryModel {

    CategoryModel({
        this.idcategory,
        this.name,
    });

    String? idcategory;
    String? name;

    factory CategoryModel.fromJson(String str) => CategoryModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        idcategory: json["idcategory"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "idcategory": idcategory,
        "name": name,
    };
}
