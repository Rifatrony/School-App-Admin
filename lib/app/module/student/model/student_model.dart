// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

StudentModel studentModelFromJson(String str) => StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  bool? success;
  List<Student>? students;
  Pagination? pagination;

  StudentModel({
    this.success,
    this.students,
    this.pagination,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    success: json["success"],
    students: json["students"] == null ? [] : List<Student>.from(json["students"]!.map((x) => Student.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "students": students == null ? [] : List<dynamic>.from(students!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class Pagination {
  int? total;
  int? totalPages;
  int? currentPage;

  Pagination({
    this.total,
    this.totalPages,
    this.currentPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    totalPages: json["totalPages"],
    currentPage: json["current_page"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "totalPages": totalPages,
    "current_page": currentPage,
  };
}

class Student {
  String? id;
  String? name;
  String? classId;
  int? rollNo;
  int? birthCertificateNo;
  int? age;
  String? fName;
  String? mName;
  String? address;
  int? number;
  String? fNid;
  String? currentEnrollYear;
  DateTime? enrollDate;
  Class? studentClass;
  Department? department;
  Section? section;

  Student({
    this.id,
    this.name,
    this.classId,
    this.rollNo,
    this.birthCertificateNo,
    this.age,
    this.fName,
    this.mName,
    this.address,
    this.number,
    this.fNid,
    this.currentEnrollYear,
    this.enrollDate,
    this.studentClass,
    this.department,
    this.section,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json["id"],
    name: json["name"],
    classId: json["class_id"],
    rollNo: json["roll_no"],
    birthCertificateNo: json["birth_certificate_no"],
    age: json["age"],
    fName: json["f_name"],
    mName: json["m_name"],
    address: json["address"],
    number: json["number"],
    fNid: json["f_nid"],
    currentEnrollYear: json["current_enroll_year"],
    enrollDate: json["enroll_date"] == null ? null : DateTime.parse(json["enroll_date"]),
    studentClass: json["class"] == null ? null : Class.fromJson(json["class"]),
    department: json["department"] == null ? null : Department.fromJson(json["department"]),
    section: json["section"] == null ? null : Section.fromJson(json["section"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "class_id": classId,
    "roll_no": rollNo,
    "birth_certificate_no": birthCertificateNo,
    "age": age,
    "f_name": fName,
    "m_name": mName,
    "address": address,
    "number": number,
    "f_nid": fNid,
    "current_enroll_year": currentEnrollYear,
    "enroll_date": enrollDate?.toIso8601String(),
    "class": studentClass?.toJson(),
    "department": department?.toJson(),
    "section": section?.toJson(),
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

class Section {
  String? id;
  String? name;
  String? classId;

  Section({
    this.id,
    this.name,
    this.classId,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    id: json["id"],
    name: json["name"],
    classId: json["class_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "class_id": classId,
  };
}

class Class {
  int? classCode;
  String? id;
  String? name;

  Class({
    this.classCode,
    this.id,
    this.name,
  });

  factory Class.fromJson(Map<String, dynamic> json) => Class(
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
