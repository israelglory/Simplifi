// To parse this JSON data, do
//
//     final bankList = bankListFromMap(jsonString);

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

BankList bankListFromMap(String str) => BankList.fromMap(json.decode(str));

String bankListToMap(BankList data) => json.encode(data.toMap());

class BankList {
  BankList({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final List<Datum> data;

  factory BankList.fromMap(Map<String, dynamic> json) => BankList(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.slug,
    required this.code,
    required this.longcode,
    required this.payWithBank,
    required this.active,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String slug;
  final String code;
  final String longcode;

  final bool payWithBank;
  final bool active;

  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        code: json["code"],
        longcode: json["longcode"],
        payWithBank: json["pay_with_bank"],
        active: json["active"],
        isDeleted: json["is_deleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "code": code,
        "longcode": longcode,
        "pay_with_bank": payWithBank,
        "active": active,
        "is_deleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
