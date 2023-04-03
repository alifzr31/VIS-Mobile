// To parse this JSON data, do
//
//     final grpo = grpoFromJson(jsonString);

import 'dart:convert';

Grpo grpoFromJson(String str) => Grpo.fromJson(json.decode(str));

String grpoToJson(Grpo data) => json.encode(data.toJson());

List<Grpo> listGrpoFromJson(String str) =>
    List<Grpo>.from(json.decode(str).map((x) => Grpo.fromJson(x)));
    
String listGrpoToJson(List<Grpo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Grpo {
    Grpo({
        this.docGrpo,
        this.tglGrpo,
        this.branch,
        this.noSj,
        this.docPo,
        this.amountGrpo,
        this.docGrn,
        this.amountGrn,
        this.amountgrpoAmountgrn,
    });

    int? docGrpo;
    String? tglGrpo;
    String? branch;
    String? noSj;
    String? docPo;
    int? amountGrpo;
    int? docGrn;
    int? amountGrn;
    int? amountgrpoAmountgrn;

    factory Grpo.fromJson(Map<String, dynamic> json) => Grpo(
        docGrpo: json["doc_grpo"],
        tglGrpo: json["tgl_grpo"],
        branch: json["branch"],
        noSj: json["no_sj"],
        docPo: json["doc_po"],
        amountGrpo: json["amount_grpo"],
        docGrn: json["doc_grn"],
        amountGrn: json["amount_grn"],
        amountgrpoAmountgrn: json["amountgrpo_amountgrn"],
    );

    Map<String, dynamic> toJson() => {
        "doc_grpo": docGrpo,
        "tgl_grpo": tglGrpo,
        "branch": branch,
        "no_sj": noSj,
        "doc_po": docPo,
        "amount_grpo": amountGrpo,
        "doc_grn": docGrn,
        "amount_grn": amountGrn,
        "amountgrpo_amountgrn": amountgrpoAmountgrn,
    };
}
