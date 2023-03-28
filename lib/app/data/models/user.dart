// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.email,
    required this.telephone,
    required this.federalTaxId,
    required this.address,
    required this.bankAccount,
    required this.telephone2,
    required this.mobilePhone,
    required this.paymentTerm,
    required this.accountBalance,
    required this.purchaseOrder,
    required this.goodsReceiptPo,
  });

  String email;
  String telephone;
  String federalTaxId;
  String address;
  String bankAccount;
  String telephone2;
  String mobilePhone;
  String paymentTerm;
  String accountBalance;
  String purchaseOrder;
  String goodsReceiptPo;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        telephone: json["telephone"],
        federalTaxId: json["federal_tax_id"],
        address: json["address"],
        bankAccount: json["Bank Account"],
        telephone2: json["telephone2"],
        mobilePhone: json["mobile_phone"],
        paymentTerm: json["payment_term"],
        accountBalance: json["account_balance"],
        purchaseOrder: json["purchase_order"],
        goodsReceiptPo: json["goods_receipt_po"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "telephone": telephone,
        "federal_tax_id": federalTaxId,
        "address": address,
        "Bank Account": bankAccount,
        "telephone2": telephone2,
        "mobile_phone": mobilePhone,
        "payment_term": paymentTerm,
        "account_balance": accountBalance,
        "purchase_order": purchaseOrder,
        "goods_receipt_po": goodsReceiptPo,
      };
}
