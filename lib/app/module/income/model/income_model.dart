// To parse this JSON data, do
//
//     final incomeModel = incomeModelFromJson(jsonString);

import 'dart:convert';

IncomeModel incomeModelFromJson(String str) => IncomeModel.fromJson(json.decode(str));

String incomeModelToJson(IncomeModel data) => json.encode(data.toJson());

class IncomeModel {
  String? message;
  List<Income>? income;

  IncomeModel({
    this.message,
    this.income,
  });

  factory IncomeModel.fromJson(Map<String, dynamic> json) => IncomeModel(
    message: json["message"],
    income: json["income"] == null ? [] : List<Income>.from(json["income"]!.map((x) => Income.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "income": income == null ? [] : List<dynamic>.from(income!.map((x) => x.toJson())),
  };
}

class Income {
  String? id;
  String? type;
  int? amount;
  String? note;

  Income({
    this.id,
    this.type,
    this.amount,
    this.note,
  });

  factory Income.fromJson(Map<String, dynamic> json) => Income(
    id: json["id"],
    type: json["type"],
    amount: json["amount"],
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "amount": amount,
    "note": note,
  };
}
