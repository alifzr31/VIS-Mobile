// To parse this JSON data, do
//
//     final masterDataDetail = masterDataDetailFromJson(jsonString);

import 'dart:convert';

MasterDataDetail masterDataDetailFromJson(String str) => MasterDataDetail.fromJson(json.decode(str));

String masterDataDetailToJson(MasterDataDetail data) => json.encode(data.toJson());

List<MasterDataDetail> listMasterDataDetailFromJson(String str) =>
    List<MasterDataDetail>.from(json.decode(str).map((x) => MasterDataDetail.fromJson(x)));
    
String listMasterDataDetailToJson(List<MasterDataDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MasterDataDetail {
    MasterDataDetail({
        this.warehouse,
        this.warehouseName,
        this.instock,
        this.commitedIn,
        this.commitedItr,
        this.onOrderpo,
        this.onOrdertr,
        this.available,
        this.itemncode,
        this.itemname,
        this.cardname,
    });

    String? warehouse;
    String? warehouseName;
    int? instock;
    int? commitedIn;
    int? commitedItr;
    int? onOrderpo;
    int? onOrdertr;
    int? available;
    String? itemncode;
    String? itemname;
    String? cardname;

    factory MasterDataDetail.fromJson(Map<String, dynamic> json) => MasterDataDetail(
        warehouse: json["warehouse"],
        warehouseName: json["warehouse_name"],
        instock: json["instock"],
        commitedIn: json["commited_in"],
        commitedItr: json["commited_itr"],
        onOrderpo: json["on_orderpo"],
        onOrdertr: json["on_ordertr"],
        available: json["available"],
        itemncode: json["itemncode"],
        itemname: json["itemname"],
        cardname: json["cardname"],
    );

    Map<String, dynamic> toJson() => {
        "warehouse": warehouse,
        "warehouse_name": warehouseName,
        "instock": instock,
        "commited_in": commitedIn,
        "commited_itr": commitedItr,
        "on_orderpo": onOrderpo,
        "on_ordertr": onOrdertr,
        "available": available,
        "itemncode": itemncode,
        "itemname": itemname,
        "cardname": cardname,
    };
}
