// To parse this JSON data, do
//
//     final salesOut = salesOutFromJson(jsonString);

import 'dart:convert';

SalesOut salesOutFromJson(String str) => SalesOut.fromJson(json.decode(str));

String salesOutToJson(SalesOut data) => json.encode(data.toJson());

List<SalesOut> listSalesOutFromJson(String str) =>
    List<SalesOut>.from(json.decode(str).map((x) => SalesOut.fromJson(x)));
    
String listSalesOutToJson(List<SalesOut> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SalesOut {
    SalesOut({
        this.type,
        this.docdate,
        this.itemcode,
        this.itemname,
        this.qty,
        this.price,
        this.total,
        this.salesname,
        this.cabang,
        this.noStruk,
        this.kodecabang,
        this.pricebefdi,
        this.discount,
    });

    String? type;
    String? docdate;
    String? itemcode;
    String? itemname;
    int? qty;
    int? price;
    int? total;
    String? salesname;
    String? cabang;
    String? noStruk;
    String? kodecabang;
    int? pricebefdi;
    String? discount;

    factory SalesOut.fromJson(Map<String, dynamic> json) => SalesOut(
        type: json["type"],
        docdate: json["docdate"],
        itemcode: json["itemcode"],
        itemname: json["itemname"],
        qty: json["qty"],
        price: json["price"],
        total: json["total"],
        salesname: json["salesname"],
        cabang: json["cabang"],
        noStruk: json["no_struk"],
        kodecabang: json["kodecabang"],
        pricebefdi: json["pricebefdi"],
        discount: json["discount"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "docdate": docdate,
        "itemcode": itemcode,
        "itemname": itemname,
        "qty": qty,
        "price": price,
        "total": total,
        "salesname": salesname,
        "cabang": cabang,
        "no_struk": noStruk,
        "kodecabang": kodecabang,
        "pricebefdi": pricebefdi,
        "discount": discount,
    };
}
