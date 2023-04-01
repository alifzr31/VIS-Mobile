// To parse this JSON data, do
//
//     final detailPo = detailPoFromJson(jsonString);

import 'dart:convert';

DetailPo detailPoFromJson(String str) => DetailPo.fromJson(json.decode(str));

String detailPoToJson(DetailPo data) => json.encode(data.toJson());

List<DetailPo> listDetailPoFromJson(String str) =>
    List<DetailPo>.from(json.decode(str).map((x) => DetailPo.fromJson(x)));

String listDetailPoToJson(List<DetailPo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailPo {
  DetailPo({
    this.itemcode,
    this.itemname,
    this.qty,
    this.store,
    this.grossPrice,
    this.total,
  });

  String? itemcode;
  String? itemname;
  int? qty;
  String? store;
  int? grossPrice;
  int? total;

  factory DetailPo.fromJson(Map<String, dynamic> json) => DetailPo(
        itemcode: json["itemcode"],
        itemname: json["itemname"],
        qty: json["qty"],
        store: json["store"],
        grossPrice: json["gross_price"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "itemcode": itemcode,
        "itemname": itemname,
        "qty": qty,
        "store": store,
        "gross_price": grossPrice,
        "total": total,
      };
}
