// To parse this JSON data, do
//
//     final sectionModel = sectionModelFromJson(jsonString);

import 'dart:convert';

SectionModel sectionModelFromJson(String str) => SectionModel.fromJson(json.decode(str));

String sectionModelToJson(SectionModel data) => json.encode(data.toJson());

class SectionModel {
  String? message;
  List<Data>? section;

  SectionModel({
    this.message,
    this.section,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
    message: json["message"],
    section: json["section"] == null ? [] : List<Data>.from(json["section"]!.map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "section": section == null ? [] : List<dynamic>.from(section!.map((x) => x.toJson())),
  };
}

class Data {
  Class? sectionClass;
  List<Section>? sections;

  Data({
    this.sectionClass,
    this.sections,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    sectionClass: json["class"] == null ? null : Class.fromJson(json["class"]),
    sections: json["sections"] == null ? [] : List<Section>.from(json["sections"]!.map((x) => Section.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "class": sectionClass?.toJson(),
    "sections": sections == null ? [] : List<dynamic>.from(sections!.map((x) => x.toJson())),
  };
}

class Class {
  String? id;
  int? classId;
  String? name;

  Class({
    this.id,
    this.classId,
    this.name,
  });

  factory Class.fromJson(Map<String, dynamic> json) => Class(
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

class Section {
  String? id;
  String? name;
  String? departmentId;
  Class? department;

  Section({
    this.id,
    this.name,
    this.departmentId,
    this.department,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    id: json["id"],
    name: json["name"],
    departmentId: json["department_id"],
    department: json["department"] == null ? null : Class.fromJson(json["department"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "department_id": departmentId,
    "department": department?.toJson(),
  };
}
