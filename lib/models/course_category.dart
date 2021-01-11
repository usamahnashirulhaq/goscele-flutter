import 'dart:convert';
import 'package:goscele/utils/constants.dart';
import 'package:hive/hive.dart';

part 'course_category.g.dart';

List<CourseCategory> courseCategoryFromJson(String str) => List<CourseCategory>.from(json.decode(str).map((x) => CourseCategory.fromJson(x)));

String courseCategoryToJson(CourseCategory data) => json.encode(data.toJson());

@HiveType(typeId: Constants.hiveAdapterCourseCategory)
class CourseCategory {
  CourseCategory({
    this.id,
    this.name,
    this.idnumber,
    this.description,
    this.descriptionformat,
    this.parent,
    this.sortorder,
    this.coursecount,
    this.visible,
    this.visibleold,
    this.timemodified,
    this.depth,
    this.path,
    this.theme,
  });

  @HiveField(1)
  int id;
  @HiveField(2)
  String name;

  dynamic idnumber;
  String description;
  int descriptionformat;
  int parent;
  int sortorder;
  int coursecount;
  int visible;
  int visibleold;
  int timemodified;
  int depth;
  String path;
  dynamic theme;

  factory CourseCategory.fromJson(Map<String, dynamic> json) => CourseCategory(
    id: json["id"],
    name: json["name"],
    idnumber: json["idnumber"],
    description: json["description"],
    descriptionformat: json["descriptionformat"],
    parent: json["parent"],
    sortorder: json["sortorder"],
    coursecount: json["coursecount"],
    visible: json["visible"],
    visibleold: json["visibleold"],
    timemodified: json["timemodified"],
    depth: json["depth"],
    path: json["path"],
    theme: json["theme"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "idnumber": idnumber,
    "description": description,
    "descriptionformat": descriptionformat,
    "parent": parent,
    "sortorder": sortorder,
    "coursecount": coursecount,
    "visible": visible,
    "visibleold": visibleold,
    "timemodified": timemodified,
    "depth": depth,
    "path": path,
    "theme": theme,
  };
}
