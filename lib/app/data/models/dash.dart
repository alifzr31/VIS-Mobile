// To parse this JSON data, do
//
//     final dash = dashFromJson(jsonString);

import 'dart:convert';

Dash dashFromJson(String str) => Dash.fromJson(json.decode(str));

String dashToJson(Dash data) => json.encode(data.toJson());

class Dash {
    Dash({
        required this.totalPo,
        required this.totalGrpo,
        required this.totalGr,
        required this.totalGrr,
        required this.totalApMem,
        required this.totalApInv,
        required this.kodeVendor,
        required this.namaVendor,
    });

    int totalPo;
    int totalGrpo;
    int totalGr;
    int totalGrr;
    int totalApMem;
    int totalApInv;
    String kodeVendor;
    String namaVendor;

    factory Dash.fromJson(Map<String, dynamic> json) => Dash(
        totalPo: json["total_po"],
        totalGrpo: json["total_grpo"],
        totalGr: json["total_gr"],
        totalGrr: json["total_grr"],
        totalApMem: json["total_ap_mem"],
        totalApInv: json["total_ap_inv"],
        kodeVendor: json["kode_vendor"],
        namaVendor: json["nama_vendor"],
    );

    Map<String, dynamic> toJson() => {
        "total_po": totalPo,
        "total_grpo": totalGrpo,
        "total_gr": totalGr,
        "total_grr": totalGrr,
        "total_ap_mem": totalApMem,
        "total_ap_inv": totalApInv,
        "kode_vendor": kodeVendor,
        "nama_vendor": namaVendor,
    };
}
