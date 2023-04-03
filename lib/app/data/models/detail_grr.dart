// To parse this JSON data, do
//
//     final detailGrr = detailGrrFromJson(jsonString);

import 'dart:convert';

DetailGrr detailGrrFromJson(String str) => DetailGrr.fromJson(json.decode(str));

String detailGrrToJson(DetailGrr data) => json.encode(data.toJson());

List<DetailGrr> listDetailGrrFromJson(String str) =>
    List<DetailGrr>.from(json.decode(str).map((x) => DetailGrr.fromJson(x)));
    
String listDetailGrrToJson(List<DetailGrr> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailGrr {
    DetailGrr({
        this.noPo,
        this.itemname,
        this.qty,
        this.unit,
        this.price,
        this.discount,
        this.total,
    });

    String? noPo;
    String? itemname;
    int? qty;
    String? unit;
    int? price;
    int? discount;
    int? total;

    factory DetailGrr.fromJson(Map<String, dynamic> json) => DetailGrr(
        noPo: json["no_po"],
        itemname: json["itemname"],
        qty: json["qty"],
        unit: json["unit"],
        price: json["price"],
        discount: json["discount"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "no_po": noPo,
        "itemname": itemname,
        "qty": qty,
        "unit": unit,
        "price": price,
        "discount": discount,
        "total": total,
    };
}
