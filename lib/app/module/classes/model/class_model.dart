// To parse this JSON data, do
//
//     final classesModel = classesModelFromJson(jsonString);

import 'dart:convert';

ClassesModel classesModelFromJson(String str) => ClassesModel.fromJson(json.decode(str));

String classesModelToJson(ClassesModel data) => json.encode(data.toJson());

class ClassesModel {
  String? message;
  List<AllClass>? allClass;

  ClassesModel({
    this.message,
    this.allClass,
  });

  factory ClassesModel.fromJson(Map<String, dynamic> json) => ClassesModel(
    message: json["message"],
    allClass: json["allClass"] == null ? [] : List<AllClass>.from(json["allClass"]!.map((x) => AllClass.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "allClass": allClass == null ? [] : List<dynamic>.from(allClass!.map((x) => x.toJson())),
  };
}

class AllClass {
  int? classCode;
  String? id;
  String? name;

  AllClass({
    this.classCode,
    this.id,
    this.name,
  });

  factory AllClass.fromJson(Map<String, dynamic> json) => AllClass(
    classCode: json["class_code"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "class_code": classCode,
    "id": id,
    "name": name,
  };
}
