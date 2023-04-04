// To parse this JSON data, do
//
//     final detailGrpo = detailGrpoFromJson(jsonString);

import 'dart:convert';

DetailGrpo detailGrpoFromJson(String str) => DetailGrpo.fromJson(json.decode(str));

String detailGrpoToJson(DetailGrpo data) => json.encode(data.toJson());

List<DetailGrpo> listDetailGrpoFromJson(String str) =>
    List<DetailGrpo>.from(json.decode(str).map((x) => DetailGrpo.fromJson(x)));
    
String listDetailGrpoToJson(List<DetailGrpo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailGrpo {
    DetailGrpo({
        this.noPo,
        this.itemname,
        this.qty,
        this.unit,
        this.grossPrice,
        this.discount,
        this.total,
    });

    String? noPo;
    String? itemname;
    int? qty;
    String? unit;
    int? grossPrice;
    int? discount;
    int? total;

    factory DetailGrpo.fromJson(Map<String, dynamic> json) => DetailGrpo(
        noPo: json["no_po"],
        itemname: json["itemname"],
        qty: json["qty"],
        unit: json["unit"],
        grossPrice: json["gross_price"],
        discount: json["discount"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "no_po": noPo,
        "itemname": itemname,
        "qty": qty,
        "unit": unit,
        "gross_price": grossPrice,
        "discount": discount,
        "total": total,
    };
}
