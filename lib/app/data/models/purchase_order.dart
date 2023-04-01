// To parse this JSON data, do
//
//     final purchaseOrder = purchaseOrderFromJson(jsonString);

import 'dart:convert';

PurchaseOrder purchaseOrderFromJson(String str) => PurchaseOrder.fromJson(json.decode(str));

String purchaseOrderToJson(PurchaseOrder data) => json.encode(data.toJson());

List<PurchaseOrder> listPurchaseOrderFromJson(String str) =>
    List<PurchaseOrder>.from(json.decode(str).map((x) => PurchaseOrder.fromJson(x)));
    
String listPurchaseOrderToJson(List<PurchaseOrder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PurchaseOrder {
    PurchaseOrder({
        this.docnum,
        this.date,
        this.description,
        this.doctotal,
        this.outstanding,
    });

    int? docnum;
    String? date;
    String? description;
    int? doctotal;
    int? outstanding;

    factory PurchaseOrder.fromJson(Map<String, dynamic> json) => PurchaseOrder(
        docnum: json["docnum"],
        date: json["date"],
        description: json["description"],
        doctotal: json["doctotal"],
        outstanding: json["outstanding"],
    );

    Map<String, dynamic> toJson() => {
        "docnum": docnum,
        "date": date,
        "description": description,
        "doctotal": doctotal,
        "outstanding": outstanding,
    };
}
