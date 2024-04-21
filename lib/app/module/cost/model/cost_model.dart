// To parse this JSON data, do
//
//     final costModel = costModelFromJson(jsonString);

import 'dart:convert';

CostModel costModelFromJson(String str) => CostModel.fromJson(json.decode(str));

String costModelToJson(CostModel data) => json.encode(data.toJson());

class CostModel {
  String? message;
  List<Cost>? cost;

  CostModel({
    this.message,
    this.cost,
  });

  factory CostModel.fromJson(Map<String, dynamic> json) => CostModel(
    message: json["message"],
    cost: json["cost"] == null ? [] : List<Cost>.from(json["cost"]!.map((x) => Cost.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "cost": cost == null ? [] : List<dynamic>.from(cost!.map((x) => x.toJson())),
  };
}

class Cost {
  String? id;
  String? type;
  int? amount;
  String? note;

  Cost({
    this.id,
    this.type,
    this.amount,
    this.note,
  });

  factory Cost.fromJson(Map<String, dynamic> json) => Cost(
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
