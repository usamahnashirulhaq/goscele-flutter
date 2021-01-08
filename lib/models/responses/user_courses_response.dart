import 'dart:convert';

List<UserCoursesResponse> usersCoursesFromJson(String str) => List<UserCoursesResponse>.from(json.decode(str).map((x) => UserCoursesResponse.fromJson(x)));

String usersCoursesToJson(List<UserCoursesResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserCoursesResponse {
  UserCoursesResponse({
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

  int id;
  String shortname;
  String fullname;
  int enrolledusercount;
  String idnumber;
  int visible;
  String summary;
  int summaryformat;
  String format;
  bool showgrades;
  String lang;
  bool enablecompletion;
  int category;
  dynamic progress;
  int startdate;
  int enddate;

  factory UserCoursesResponse.fromJson(Map<String, dynamic> json) => UserCoursesResponse(
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
