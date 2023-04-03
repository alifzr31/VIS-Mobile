// To parse this JSON data, do
//
//     final globalModel = globalModelFromJson(jsonString);

import 'dart:convert';

GlobalModel globalModelFromJson(String str) => GlobalModel.fromJson(json.decode(str));

String globalModelToJson(GlobalModel data) => json.encode(data.toJson());

List<GlobalModel> listGlobalModelFromJson(String str) =>
    List<GlobalModel>.from(json.decode(str).map((x) => GlobalModel.fromJson(x)));
    
String listGlobalModelToJson(List<GlobalModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GlobalModel {
    GlobalModel({
        this.docnum,
        this.date,
        this.description,
        this.doctotal,
    });

    int? docnum;
    String? date;
    String? description;
    int? doctotal;

    factory GlobalModel.fromJson(Map<String, dynamic> json) => GlobalModel(
        docnum: json["docnum"],
        date: json["date"],
        description: json["description"],
        doctotal: json["doctotal"],
    );

    Map<String, dynamic> toJson() => {
        "docnum": docnum,
        "date": date,
        "description": description,
        "doctotal": doctotal,
    };
}
