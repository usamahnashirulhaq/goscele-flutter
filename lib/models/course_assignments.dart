import 'dart:convert';
import 'package:goscele/utils/constants.dart';
import 'package:hive/hive.dart';

part 'course_assignments.g.dart';

CourseAssignments courseAssignmentsFromJson(String str) => CourseAssignments.fromJson(json.decode(str));

String courseAssignmentsToJson(CourseAssignments data) => json.encode(data.toJson());

@HiveType(typeId: Constants.hiveAdapterCourseAssignment)
class CourseAssignments {
  CourseAssignments({
    this.courses,
    this.warnings,
  });

  @HiveField(1)
  List<Course> courses;

  List<dynamic> warnings;

  factory CourseAssignments.fromJson(Map<String, dynamic> json) => CourseAssignments(
    courses: List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
    warnings: List<dynamic>.from(json["warnings"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
    "warnings": List<dynamic>.from(warnings.map((x) => x)),
  };
}

@HiveType(typeId: Constants.hiveAdapterCourseAssignmentCourse)
class Course {
  Course({
    this.id,
    this.fullname,
    this.shortname,
    this.timemodified,
    this.assignments,
  });

  @HiveField(1)
  String fullname;

  @HiveField(2)
  String shortname;

  @HiveField(3)
  int id;

  @HiveField(4)
  int timemodified;

  @HiveField(5)
  List<Assignment> assignments;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    fullname: json["fullname"],
    shortname: json["shortname"],
    timemodified: json["timemodified"],
    assignments: List<Assignment>.from(json["assignments"].map((x) => Assignment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "shortname": shortname,
    "timemodified": timemodified,
    "assignments": List<dynamic>.from(assignments.map((x) => x.toJson())),
  };
}

@HiveType(typeId: Constants.hiveAdapterAssignment)
class Assignment {
  Assignment({
    this.id,
    this.cmid,
    this.course,
    this.name,
    this.nosubmissions,
    this.submissiondrafts,
    this.sendnotifications,
    this.sendlatenotifications,
    this.sendstudentnotifications,
    this.duedate,
    this.allowsubmissionsfromdate,
    this.grade,
    this.timemodified,
    this.completionsubmit,
    this.cutoffdate,
    this.gradingduedate,
    this.teamsubmission,
    this.requireallteammemberssubmit,
    this.teamsubmissiongroupingid,
    this.blindmarking,
    this.revealidentities,
    this.attemptreopenmethod,
    this.maxattempts,
    this.markingworkflow,
    this.markingallocation,
    this.requiresubmissionstatement,
    this.preventsubmissionnotingroup,
    this.configs,
    this.intro,
    this.introformat,
    this.introfiles,
    this.introattachments,
  });

  @HiveField(1)
  int id;
  int cmid;
  int course;

  @HiveField(2)
  String name;
  int nosubmissions;
  int submissiondrafts;
  int sendnotifications;
  int sendlatenotifications;
  int sendstudentnotifications;

  @HiveField(3)
  int duedate;
  int allowsubmissionsfromdate;
  int grade;
  int timemodified;
  int completionsubmit;
  int cutoffdate;
  int gradingduedate;
  int teamsubmission;
  int requireallteammemberssubmit;
  int teamsubmissiongroupingid;
  int blindmarking;
  int revealidentities;
  Attemptreopenmethod attemptreopenmethod;
  int maxattempts;
  int markingworkflow;
  int markingallocation;
  int requiresubmissionstatement;
  int preventsubmissionnotingroup;
  List<Config> configs;
  String intro;
  int introformat;
  List<dynamic> introfiles;
  List<dynamic> introattachments;

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
    id: json["id"],
    cmid: json["cmid"],
    course: json["course"],
    name: json["name"],
    nosubmissions: json["nosubmissions"],
    submissiondrafts: json["submissiondrafts"],
    sendnotifications: json["sendnotifications"],
    sendlatenotifications: json["sendlatenotifications"],
    sendstudentnotifications: json["sendstudentnotifications"],
    duedate: json["duedate"],
    allowsubmissionsfromdate: json["allowsubmissionsfromdate"],
    grade: json["grade"],
    timemodified: json["timemodified"],
    completionsubmit: json["completionsubmit"],
    cutoffdate: json["cutoffdate"],
    gradingduedate: json["gradingduedate"],
    teamsubmission: json["teamsubmission"],
    requireallteammemberssubmit: json["requireallteammemberssubmit"],
    teamsubmissiongroupingid: json["teamsubmissiongroupingid"],
    blindmarking: json["blindmarking"],
    revealidentities: json["revealidentities"],
    attemptreopenmethod: attemptreopenmethodValues.map[json["attemptreopenmethod"]],
    maxattempts: json["maxattempts"],
    markingworkflow: json["markingworkflow"],
    markingallocation: json["markingallocation"],
    requiresubmissionstatement: json["requiresubmissionstatement"],
    preventsubmissionnotingroup: json["preventsubmissionnotingroup"],
    configs: List<Config>.from(json["configs"].map((x) => Config.fromJson(x))),
    intro: json["intro"],
    introformat: json["introformat"],
    introfiles: List<dynamic>.from(json["introfiles"].map((x) => x)),
    introattachments: List<dynamic>.from(json["introattachments"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cmid": cmid,
    "course": course,
    "name": name,
    "nosubmissions": nosubmissions,
    "submissiondrafts": submissiondrafts,
    "sendnotifications": sendnotifications,
    "sendlatenotifications": sendlatenotifications,
    "sendstudentnotifications": sendstudentnotifications,
    "duedate": duedate,
    "allowsubmissionsfromdate": allowsubmissionsfromdate,
    "grade": grade,
    "timemodified": timemodified,
    "completionsubmit": completionsubmit,
    "cutoffdate": cutoffdate,
    "gradingduedate": gradingduedate,
    "teamsubmission": teamsubmission,
    "requireallteammemberssubmit": requireallteammemberssubmit,
    "teamsubmissiongroupingid": teamsubmissiongroupingid,
    "blindmarking": blindmarking,
    "revealidentities": revealidentities,
    "attemptreopenmethod": attemptreopenmethodValues.reverse[attemptreopenmethod],
    "maxattempts": maxattempts,
    "markingworkflow": markingworkflow,
    "markingallocation": markingallocation,
    "requiresubmissionstatement": requiresubmissionstatement,
    "preventsubmissionnotingroup": preventsubmissionnotingroup,
    "configs": List<dynamic>.from(configs.map((x) => x.toJson())),
    "intro": intro,
    "introformat": introformat,
    "introfiles": List<dynamic>.from(introfiles.map((x) => x)),
    "introattachments": List<dynamic>.from(introattachments.map((x) => x)),
  };
}

enum Attemptreopenmethod { NONE }

final attemptreopenmethodValues = EnumValues({
  "none": Attemptreopenmethod.NONE
});

class Config {
  Config({
    this.plugin,
    this.subtype,
    this.name,
    this.value,
  });

  Plugin plugin;
  Subtype subtype;
  Name name;
  String value;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
    plugin: pluginValues.map[json["plugin"]],
    subtype: subtypeValues.map[json["subtype"]],
    name: nameValues.map[json["name"]],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "plugin": pluginValues.reverse[plugin],
    "subtype": subtypeValues.reverse[subtype],
    "name": nameValues.reverse[name],
    "value": value,
  };
}

enum Name { ENABLED, MAXFILESUBMISSIONS, MAXSUBMISSIONSIZEBYTES, COMMENTINLINE, FILETYPESLIST, WORDLIMIT, WORDLIMITENABLED }

final nameValues = EnumValues({
  "commentinline": Name.COMMENTINLINE,
  "enabled": Name.ENABLED,
  "filetypeslist": Name.FILETYPESLIST,
  "maxfilesubmissions": Name.MAXFILESUBMISSIONS,
  "maxsubmissionsizebytes": Name.MAXSUBMISSIONSIZEBYTES,
  "wordlimit": Name.WORDLIMIT,
  "wordlimitenabled": Name.WORDLIMITENABLED
});

enum Plugin { FILE, COMMENTS, EDITPDF, ONLINETEXT }

final pluginValues = EnumValues({
  "comments": Plugin.COMMENTS,
  "editpdf": Plugin.EDITPDF,
  "file": Plugin.FILE,
  "onlinetext": Plugin.ONLINETEXT
});

enum Subtype { ASSIGNSUBMISSION, ASSIGNFEEDBACK }

final subtypeValues = EnumValues({
  "assignfeedback": Subtype.ASSIGNFEEDBACK,
  "assignsubmission": Subtype.ASSIGNSUBMISSION
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
