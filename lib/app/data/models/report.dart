// To parse this JSON data, do
//
//     final report = reportFromJson(jsonString);

import 'dart:convert';

Report reportFromJson(String str) => Report.fromJson(json.decode(str));

String reportToJson(Report data) => json.encode(data.toJson());

List<Report> listReportFromJson(String str) =>
    List<Report>.from(json.decode(str).map((x) => Report.fromJson(x)));
    
String listReportToJson(List<Report> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Report {
    Report({
        this.branchName,
        this.col2,
        this.col3,
    });

    String? branchName;
    int? col2;
    int? col3;

    factory Report.fromJson(Map<String, dynamic> json) => Report(
        branchName: json["branch_name"],
        col2: json["col2"],
        col3: json["col3"],
    );

    Map<String, dynamic> toJson() => {
        "branch_name": branchName,
        "col2": col2,
        "col3": col3,
    };
}
