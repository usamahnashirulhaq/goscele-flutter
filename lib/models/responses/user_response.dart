import 'dart:convert';

List<UserResponse> userResponseFromJson(String str) => List<UserResponse>.from(json.decode(str).map((x) => UserResponse.fromJson(x)));

String userResponseToJson(List<UserResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserResponse {
  UserResponse({
    this.id,
    this.username,
    this.firstname,
    this.lastname,
    this.fullname,
    this.email,
    this.department,
    this.firstaccess,
    this.lastaccess,
    this.auth,
    this.suspended,
    this.confirmed,
    this.lang,
    this.theme,
    this.timezone,
    this.mailformat,
    this.description,
    this.descriptionformat,
    this.profileimageurlsmall,
    this.profileimageurl,
    this.preferences,
  });

  int id;
  String username;
  String firstname;
  String lastname;
  String fullname;
  String email;
  String department;
  int firstaccess;
  int lastaccess;
  String auth;
  bool suspended;
  bool confirmed;
  String lang;
  String theme;
  String timezone;
  int mailformat;
  String description;
  int descriptionformat;
  String profileimageurlsmall;
  String profileimageurl;
  List<Preference> preferences;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    id: json["id"],
    username: json["username"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    fullname: json["fullname"],
    email: json["email"],
    department: json["department"],
    firstaccess: json["firstaccess"],
    lastaccess: json["lastaccess"],
    auth: json["auth"],
    suspended: json["suspended"],
    confirmed: json["confirmed"],
    lang: json["lang"],
    theme: json["theme"],
    timezone: json["timezone"],
    mailformat: json["mailformat"],
    description: json["description"],
    descriptionformat: json["descriptionformat"],
    profileimageurlsmall: json["profileimageurlsmall"],
    profileimageurl: json["profileimageurl"],
    preferences: List<Preference>.from(json["preferences"].map((x) => Preference.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "firstname": firstname,
    "lastname": lastname,
    "fullname": fullname,
    "email": email,
    "department": department,
    "firstaccess": firstaccess,
    "lastaccess": lastaccess,
    "auth": auth,
    "suspended": suspended,
    "confirmed": confirmed,
    "lang": lang,
    "theme": theme,
    "timezone": timezone,
    "mailformat": mailformat,
    "description": description,
    "descriptionformat": descriptionformat,
    "profileimageurlsmall": profileimageurlsmall,
    "profileimageurl": profileimageurl,
    "preferences": List<dynamic>.from(preferences.map((x) => x.toJson())),
  };
}

class Preference {
  Preference({
    this.name,
    this.value,
  });

  String name;
  dynamic value;

  factory Preference.fromJson(Map<String, dynamic> json) => Preference(
    name: json["name"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value,
  };
}