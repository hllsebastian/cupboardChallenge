import 'dart:convert';

class TrademarkModel {
    TrademarkModel({
        this.idTrademark,
        required this.mark,
    });

    String? idTrademark;
    String mark;

    factory TrademarkModel.fromJson(String str) => TrademarkModel.fromMap(json.decode(str));

    // String toJson() => json.encode(toMap());

    factory TrademarkModel.fromMap(Map<String, dynamic> json) => TrademarkModel(
        idTrademark: json["idTrademark"],
        mark: json["mark"],
    );

    Map<String, dynamic> toJson() => {
        "idTrademark": idTrademark,
        "mark": mark,
    };

    TrademarkModel update() => TrademarkModel(
    idTrademark: idTrademark,
    mark: mark
  );
}
