// To parse this JSON data, do
//
//     final detailApInv = detailApInvFromJson(jsonString);

import 'dart:convert';

DetailApInv detailApInvFromJson(String str) => DetailApInv.fromJson(json.decode(str));

String detailApInvToJson(DetailApInv data) => json.encode(data.toJson());

List<DetailApInv> listDetailApInvFromJson(String str) =>
    List<DetailApInv>.from(json.decode(str).map((x) => DetailApInv.fromJson(x)));
    
String listDetailApInvToJson(List<DetailApInv> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailApInv {
    DetailApInv({
        this.noGrpo,
        this.deliveryNumber,
        this.grpoDate,
        this.total,
    });

    int? noGrpo;
    String? deliveryNumber;
    String? grpoDate;
    int? total;

    factory DetailApInv.fromJson(Map<String, dynamic> json) => DetailApInv(
        noGrpo: json["no_grpo"],
        deliveryNumber: json["delivery_number"],
        grpoDate: json["grpo_date"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "no_grpo": noGrpo,
        "delivery_number": deliveryNumber,
        "grpo_date": grpoDate,
        "total": total,
    };
}
