// To parse this JSON data, do
//
//     final allClassModel = allClassModelFromJson(jsonString);

import 'dart:convert';

AllClassModel allClassModelFromJson(String str) => AllClassModel.fromJson(json.decode(str));

String allClassModelToJson(AllClassModel data) => json.encode(data.toJson());

class AllClassModel {
  String? message;
  List<Data>? data;

  AllClassModel({
    this.message,
    this.data,
  });

  factory AllClassModel.fromJson(Map<String, dynamic> json) => AllClassModel(
    message: json["message"],
    data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Data {
  String? id;
  int? classId;
  String? name;

  Data({
    this.id,
    this.classId,
    this.name,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    classId: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": classId,
    "name": name,
  };
}
