import 'dart:convert';
import 'package:goscele/utils/constants.dart';
import 'package:hive/hive.dart';

part 'user_course.g.dart';

List<UserCourse> usersCoursesFromJson(String str) => List<UserCourse>.from(json.decode(str).map((x) => UserCourse.fromJson(x)));

String usersCoursesToJson(List<UserCourse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: Constants.hiveAdapterCourse)
class UserCourse {
  UserCourse({
    this.id,
    this.shortname,
    this.fullname,
    this.enrolledusercount,
    this.idnumber,
    this.visible,
    this.summary,
    this.summaryformat,
    this.format,
    this.showgrades,
    this.lang,
    this.enablecompletion,
    this.category,
    this.progress,
    this.startdate,
    this.enddate,
  });

  @HiveField(1)
  int id;

  @HiveField(2)
  String shortname;

  @HiveField(3)
  String fullname;

  @HiveField(4)
  int enrolledusercount;

  @HiveField(5)
  String idnumber;

  @HiveField(6)
  int visible;

  @HiveField(7)
  String summary;

  @HiveField(8)
  int summaryformat;

  @HiveField(9)
  String format;

  @HiveField(10)
  bool showgrades;

  @HiveField(11)
  String lang;

  @HiveField(12)
  bool enablecompletion;

  @HiveField(13)
  int category;

  @HiveField(14)
  dynamic progress;

  @HiveField(15)
  int startdate;

  @HiveField(16)
  int enddate;

  factory UserCourse.fromJson(Map<String, dynamic> json) => UserCourse(
    id: json["id"],
    shortname: json["shortname"],
    fullname: json["fullname"],
    enrolledusercount: json["enrolledusercount"],
    idnumber: json["idnumber"],
    visible: json["visible"],
    summary: json["summary"],
    summaryformat: json["summaryformat"],
    format: json["format"],
    showgrades: json["showgrades"],
    lang: json["lang"],
    enablecompletion: json["enablecompletion"],
    category: json["category"],
    progress: json["progress"],
    startdate: json["startdate"],
    enddate: json["enddate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shortname": shortname,
    "fullname": fullname,
    "enrolledusercount": enrolledusercount,
    "idnumber": idnumber,
    "visible": visible,
    "summary": summary,
    "summaryformat": summaryformat,
    "format": format,
    "showgrades": showgrades,
    "lang": lang,
    "enablecompletion": enablecompletion,
    "category": category,
    "progress": progress,
    "startdate": startdate,
    "enddate": enddate,
  };
}
