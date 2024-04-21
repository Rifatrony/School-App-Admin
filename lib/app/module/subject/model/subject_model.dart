// To parse this JSON data, do
//
//     final subjectModel = subjectModelFromJson(jsonString);

import 'dart:convert';

SubjectModel subjectModelFromJson(String str) => SubjectModel.fromJson(json.decode(str));

String subjectModelToJson(SubjectModel data) => json.encode(data.toJson());

class SubjectModel {
  String? message;
  List<Subject>? subjects;

  SubjectModel({
    this.message,
    this.subjects,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
    message: json["message"],
    subjects: json["subjects"] == null ? [] : List<Subject>.from(json["subjects"]!.map((x) => Subject.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x.toJson())),
  };
}

class Subject {
  String? id;
  String? name;
  Classes? classes;
  Classes? department;

  Subject({
    this.id,
    this.name,
    this.classes,
    this.department,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json["id"],
    name: json["name"],
    classes: json["classes"] == null ? null : Classes.fromJson(json["classes"]),
    department: json["department"] == null ? null : Classes.fromJson(json["department"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "classes": classes?.toJson(),
    "department": department?.toJson(),
  };
}

class Classes {
  String? id;
  String? name;

  Classes({
    this.id,
    this.name,
  });

  factory Classes.fromJson(Map<String, dynamic> json) => Classes(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
