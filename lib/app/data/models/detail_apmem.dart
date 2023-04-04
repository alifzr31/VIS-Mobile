// To parse this JSON data, do
//
//     final detailApMem = detailApMemFromJson(jsonString);

import 'dart:convert';

DetailApMem detailApMemFromJson(String str) => DetailApMem.fromJson(json.decode(str));

String detailApMemToJson(DetailApMem data) => json.encode(data.toJson());

List<DetailApMem> listDetailApMemFromJson(String str) =>
    List<DetailApMem>.from(json.decode(str).map((x) => DetailApMem.fromJson(x)));
    
String listDetailApMemToJson(List<DetailApMem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailApMem {
    DetailApMem({
        this.itemcode,
        this.itemname,
        this.qty,
        this.unit,
        this.price,
        this.diskon,
        this.total,
    });

    dynamic itemcode;
    String? itemname;
    int? qty;
    dynamic unit;
    int? price;
    int? diskon;
    int? total;

    factory DetailApMem.fromJson(Map<String, dynamic> json) => DetailApMem(
        itemcode: json["itemcode"],
        itemname: json["itemname"],
        qty: json["qty"],
        unit: json["unit"],
        price: json["price"],
        diskon: json["diskon"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "itemcode": itemcode,
        "itemname": itemname,
        "qty": qty,
        "unit": unit,
        "price": price,
        "diskon": diskon,
        "total": total,
    };
}
