// To parse this JSON data, do
//
//     final noticeModel = noticeModelFromJson(jsonString);

import 'dart:convert';

NoticeModel noticeModelFromJson(String str) => NoticeModel.fromJson(json.decode(str));

String noticeModelToJson(NoticeModel data) => json.encode(data.toJson());

class NoticeModel {
  String? message;
  List<Notice>? notices;

  NoticeModel({
    this.message,
    this.notices,
  });

  factory NoticeModel.fromJson(Map<String, dynamic> json) => NoticeModel(
    message: json["message"],
    notices: json["notices"] == null ? [] : List<Notice>.from(json["notices"]!.map((x) => Notice.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "notices": notices == null ? [] : List<dynamic>.from(notices!.map((x) => x.toJson())),
  };
}

class Notice {
  String? id;
  String? title;
  String? subtitle;
  String? message;

  Notice({
    this.id,
    this.title,
    this.subtitle,
    this.message,
  });

  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "message": message,
  };
}
