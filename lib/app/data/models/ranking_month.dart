// To parse this JSON data, do
//
//     final rankingMonth = rankingMonthFromJson(jsonString);

import 'dart:convert';

RankingMonth rankingMonthFromJson(String str) => RankingMonth.fromJson(json.decode(str));

String rankingMonthToJson(RankingMonth data) => json.encode(data.toJson());

List<RankingMonth> listRankingMonthFromJson(String str) =>
    List<RankingMonth>.from(json.decode(str).map((x) => RankingMonth.fromJson(x)));
    
String listRankingMonthToJson(List<RankingMonth> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RankingMonth {
    RankingMonth({
        this.ranking,
        this.vendor,
        this.brand,
    });

    int? ranking;
    String? vendor;
    String? brand;

    factory RankingMonth.fromJson(Map<String, dynamic> json) => RankingMonth(
        ranking: json["ranking"],
        vendor: json["vendor"],
        brand: json["brand"],
    );

    Map<String, dynamic> toJson() => {
        "ranking": ranking,
        "vendor": vendor,
        "brand": brand,
    };
}
