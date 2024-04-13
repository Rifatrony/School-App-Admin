// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

StudentModel studentModelFromJson(String str) => StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  List<Student>? students;

  StudentModel({
    this.students,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    students: json["students"] == null ? [] : List<Student>.from(json["students"]!.map((x) => Student.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "students": students == null ? [] : List<dynamic>.from(students!.map((x) => x.toJson())),
  };
}

class Student {
  String? id;
  String? studentId;
  int? rollNo;
  String? name;
  int? classId;
  int? birthCertificateNo;
  String? fName;
  String? mName;
  int? number;
  String? fNid;
  String? password;
  DateTime? enrollDate;
  String? currentEnrollYear;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Student({
    this.id,
    this.studentId,
    this.rollNo,
    this.name,
    this.classId,
    this.birthCertificateNo,
    this.fName,
    this.mName,
    this.number,
    this.fNid,
    this.password,
    this.enrollDate,
    this.currentEnrollYear,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json["_id"],
    studentId: json["id"],
    rollNo: json["roll_no"],
    name: json["name"],
    classId: json["class_id"],
    birthCertificateNo: json["birth_certificate_no"],
    fName: json["f_name"],
    mName: json["m_name"],
    number: json["number"],
    fNid: json["f_nid"],
    password: json["password"],
    enrollDate: json["enroll_date"] == null ? null : DateTime.parse(json["enroll_date"]),
    currentEnrollYear: json["current_enroll_year"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": studentId,
    "roll_no": rollNo,
    "name": name,
    "class_id": classId,
    "birth_certificate_no": birthCertificateNo,
    "f_name": fName,
    "m_name": mName,
    "number": number,
    "f_nid": fNid,
    "password": password,
    "enroll_date": "${enrollDate!.year.toString().padLeft(4, '0')}-${enrollDate!.month.toString().padLeft(2, '0')}-${enrollDate!.day.toString().padLeft(2, '0')}",
    "current_enroll_year": currentEnrollYear,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
