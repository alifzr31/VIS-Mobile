// To parse this JSON data, do
//
//     final detailGr = detailGrFromJson(jsonString);

import 'dart:convert';

DetailGr detailGrFromJson(String str) => DetailGr.fromJson(json.decode(str));

String detailGrToJson(DetailGr data) => json.encode(data.toJson());

List<DetailGr> listDetailGrFromJson(String str) =>
    List<DetailGr>.from(json.decode(str).map((x) => DetailGr.fromJson(x)));
    
String listDetailGrToJson(List<DetailGr> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailGr {
    DetailGr({
        this.itemcode,
        this.itemname,
        this.qty,
        this.unit,
        this.price,
        this.discount,
        this.total,
    });

    String? itemcode;
    String? itemname;
    int? qty;
    String? unit;
    int? price;
    int? discount;
    int? total;

    factory DetailGr.fromJson(Map<String, dynamic> json) => DetailGr(
        itemcode: json["itemcode"],
        itemname: json["itemname"],
        qty: json["qty"],
        unit: json["unit"],
        price: json["price"],
        discount: json["discount"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "itemcode": itemcode,
        "itemname": itemname,
        "qty": qty,
        "unit": unit,
        "price": price,
        "discount": discount,
        "total": total,
    };
}
