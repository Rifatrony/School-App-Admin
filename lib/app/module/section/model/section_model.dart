// To parse this JSON data, do
//
//     final sectionModel = sectionModelFromJson(jsonString);

import 'dart:convert';

SectionModel sectionModelFromJson(String str) => SectionModel.fromJson(json.decode(str));

String sectionModelToJson(SectionModel data) => json.encode(data.toJson());

class SectionModel {
  String? message;
  List<Section>? sections;

  SectionModel({
    this.message,
    this.sections,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
    message: json["message"],
    sections: json["sections"] == null ? [] : List<Section>.from(json["sections"]!.map((x) => Section.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "sections": sections == null ? [] : List<dynamic>.from(sections!.map((x) => x.toJson())),
  };
}

class Section {
  String? id;
  String? name;
  Class? sectionClass;

  Section({
    this.id,
    this.name,
    this.sectionClass,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    id: json["id"],
    name: json["name"],
    sectionClass: json["class"] == null ? null : Class.fromJson(json["class"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "class": sectionClass?.toJson(),
  };
}

class Class {
  String? id;
  String? name;

  Class({
    this.id,
    this.name,
  });

  factory Class.fromJson(Map<String, dynamic> json) => Class(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
