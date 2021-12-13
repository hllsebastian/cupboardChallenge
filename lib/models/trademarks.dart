import 'dart:convert';

class Trademark {
    Trademark({
        this.idTrademark,
        required this.mark,
    });

    String? idTrademark;
    String mark;

    factory Trademark.fromJson(String str) => Trademark.fromMap(json.decode(str));

    // String toJson() => json.encode(toMap());

    factory Trademark.fromMap(Map<String, dynamic> json) => Trademark(
        idTrademark: json["idTrademark"],
        mark: json["mark"],
    );

    Map<String, dynamic> toJson() => {
        "idTrademark": idTrademark,
        "mark": mark,
    };

    Trademark update() => Trademark(
    idTrademark: idTrademark,
    mark: mark
  );
}
