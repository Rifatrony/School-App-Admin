// To parse this JSON data, do
//
//     final departmentModel = departmentModelFromJson(jsonString);

import 'dart:convert';

DepartmentModel departmentModelFromJson(String str) => DepartmentModel.fromJson(json.decode(str));

String departmentModelToJson(DepartmentModel data) => json.encode(data.toJson());

class DepartmentModel {
  String? message;
  List<Department>? departments;

  DepartmentModel({
    this.message,
    this.departments,
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json) => DepartmentModel(
    message: json["message"],
    departments: json["departments"] == null ? [] : List<Department>.from(json["departments"]!.map((x) => Department.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "departments": departments == null ? [] : List<dynamic>.from(departments!.map((x) => x.toJson())),
  };
}

class Department {
  String? id;
  String? name;

  Department({
    this.id,
    this.name,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
