// To parse this JSON data, do
//
//     final category = categoryFromMap(jsonString);

import 'dart:convert';

class Category {
    Category({
        this.idcategory,
        this.name,
    });

    String? idcategory;
    String? name;

    factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Category.fromMap(Map<String, dynamic> json) => Category(
        idcategory: json["idcategory"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "idcategory": idcategory,
        "name": name,
    };
}
