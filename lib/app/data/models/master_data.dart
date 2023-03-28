// To parse this JSON data, do
//
//     final masterData = masterDataFromJson(jsonString);

import 'dart:convert';

MasterData masterDataFromJson(String str) =>
    MasterData.fromJson(json.decode(str));

String masterDataToJson(MasterData data) => json.encode(data.toJson());

List<MasterData> listMasterDataFromJson(String str) =>
    List<MasterData>.from(json.decode(str).map((x) => MasterData.fromJson(x)));
    
String listMasterDataToJson(List<MasterData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MasterData {
  MasterData({
    this.code,
    this.name,
    this.stock,
  });

  String? code;
  String? name;
  int? stock;

  factory MasterData.fromJson(Map<String, dynamic> json) => MasterData(
        code: json["code"],
        name: json["name"],
        stock: json["stock"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "stock": stock,
      };
}
