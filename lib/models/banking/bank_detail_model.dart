// To parse this JSON data, do
//
//     final bankDetail = bankDetailFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BankDetail bankDetailFromMap(String str) =>
    BankDetail.fromMap(json.decode(str));

String bankDetailToMap(BankDetail data) => json.encode(data.toMap());

class BankDetail {
  BankDetail({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final Data data;

  factory BankDetail.fromMap(Map<String, dynamic> json) => BankDetail(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data.toMap(),
      };
}

class Data {
  Data({
    this.accountNumber,
    this.accountName,
    this.bankId,
  });

  final String? accountNumber;
  final String? accountName;
  final int? bankId;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        accountNumber: json["account_number"],
        accountName: json["account_name"],
        bankId: json["bank_id"],
      );

  Map<String, dynamic> toMap() => {
        "account_number": accountNumber,
        "account_name": accountName,
        "bank_id": bankId,
      };
}
