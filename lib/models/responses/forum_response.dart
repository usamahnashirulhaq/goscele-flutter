// To parse this JSON data, do
//
//     final discussionResponse = discussionResponseFromJson(jsonString);

import 'dart:convert';

import 'package:goscele/utils/constants.dart';
import 'package:goscele/utils/custom_functions.dart';
import 'package:hive/hive.dart';

part 'forum_response.g.dart';

ForumResponse forumResponseFromJson(String str) =>
    ForumResponse.fromJson(json.decode(str));

String forumResponseToJson(ForumResponse data) => json.encode(data.toJson());

class ForumResponse {
  ForumResponse({
    this.discussions,
  });

  List<Discussion> discussions;

  factory ForumResponse.fromJson(Map<String, dynamic> json) => ForumResponse(
        discussions: List<Discussion>.from(
            json["discussions"].map((x) => Discussion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "discussions": List<dynamic>.from(discussions.map((x) => x.toJson())),
      };
}

@HiveType(typeId: Constants.hiveAdapterForum)
class Discussion {
  Discussion({
    this.id,
    this.name,
    this.groupid,
    this.timemodified,
    this.usermodified,
    this.timestart,
    this.timeend,
    this.discussion,
    this.parent,
    this.userid,
    this.created,
    this.modified,
    this.mailed,
    this.subject,
    this.message,
    this.messageformat,
    this.messagetrust,
    this.attachment,
    this.totalscore,
    this.mailnow,
    this.userfullname,
    this.usermodifiedfullname,
    this.userpictureurl,
    this.usermodifiedpictureurl,
    this.numreplies,
    this.numunread,
    this.pinned,
    this.locked,
    this.canreply,
    this.attachments,
  });

  @HiveField(1)
  int id;

  @HiveField(2)
  String name;

  @HiveField(3)
  int groupid;

  @HiveField(4)
  int timemodified;

  @HiveField(5)
  int usermodified;

  @HiveField(6)
  int timestart;

  @HiveField(7)
  int timeend;

  @HiveField(8)
  int discussion;

  @HiveField(9)
  int parent;

  @HiveField(10)
  int userid;

  @HiveField(11)
  int created;

  @HiveField(12)
  int modified;

  @HiveField(13)
  int mailed;

  @HiveField(14)
  String subject;

  @HiveField(15)
  String message;

  @HiveField(16)
  int messageformat;

  @HiveField(17)
  int messagetrust;

  @HiveField(18)
  String attachment;

  @HiveField(19)
  int totalscore;

  @HiveField(20)
  int mailnow;

  @HiveField(21)
  String userfullname;

  @HiveField(22)
  String usermodifiedfullname;

  @HiveField(23)
  String userpictureurl;

  @HiveField(24)
  String usermodifiedpictureurl;

  @HiveField(25)
  String numreplies;

  @HiveField(26)
  int numunread;

  @HiveField(27)
  bool pinned;

  @HiveField(28)
  bool locked;

  @HiveField(29)
  bool canreply;

  List<Attachment> attachments;

  factory Discussion.fromJson(Map<String, dynamic> json) => Discussion(
        id: json["id"],
        name: json["name"],
        groupid: json["groupid"],
        timemodified: json["timemodified"],
        usermodified: json["usermodified"],
        timestart: json["timestart"],
        timeend: json["timeend"],
        discussion: json["discussion"],
        parent: json["parent"],
        userid: json["userid"],
        created: json["created"],
        modified: json["modified"],
        mailed: json["mailed"],
        subject: json["subject"],
        message: removeAllHtmlTags(json["message"]),
        messageformat: json["messageformat"],
        messagetrust: json["messagetrust"],
        attachment: json["attachment"],
        totalscore: json["totalscore"],
        mailnow: json["mailnow"],
        userfullname: json["userfullname"],
        usermodifiedfullname: json["usermodifiedfullname"],
        userpictureurl: json["userpictureurl"],
        usermodifiedpictureurl: json["usermodifiedpictureurl"],
        numreplies: json["numreplies"],
        numunread: json["numunread"],
        pinned: json["pinned"],
        locked: json["locked"],
        canreply: json["canreply"],
        attachments: json["attachments"] == null
            ? null
            : List<Attachment>.from(
                json["attachments"].map((x) => Attachment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "groupid": groupid,
        "timemodified": timemodified,
        "usermodified": usermodified,
        "timestart": timestart,
        "timeend": timeend,
        "discussion": discussion,
        "parent": parent,
        "userid": userid,
        "created": created,
        "modified": modified,
        "mailed": mailed,
        "subject": subject,
        "message": message,
        "messageformat": messageformat,
        "messagetrust": messagetrust,
        "attachment": attachment,
        "totalscore": totalscore,
        "mailnow": mailnow,
        "userfullname": userfullname,
        "usermodifiedfullname": usermodifiedfullname,
        "userpictureurl": userpictureurl,
        "usermodifiedpictureurl": usermodifiedpictureurl,
        "numreplies": numreplies,
        "numunread": numunread,
        "pinned": pinned,
        "locked": locked,
        "canreply": canreply,
        "attachments": attachments == null
            ? null
            : List<dynamic>.from(attachments.map((x) => x.toJson())),
      };
}

class Attachment {
  Attachment({
    this.filename,
    this.filepath,
    this.filesize,
    this.fileurl,
    this.timemodified,
    this.mimetype,
    this.isexternalfile,
  });

  String filename;
  String filepath;
  int filesize;
  String fileurl;
  int timemodified;
  String mimetype;
  bool isexternalfile;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        filename: json["filename"],
        filepath: json["filepath"],
        filesize: json["filesize"],
        fileurl: json["fileurl"],
        timemodified: json["timemodified"],
        mimetype: json["mimetype"],
        isexternalfile: json["isexternalfile"],
      );

  Map<String, dynamic> toJson() => {
        "filename": filename,
        "filepath": filepath,
        "filesize": filesize,
        "fileurl": fileurl,
        "timemodified": timemodified,
        "mimetype": mimetype,
        "isexternalfile": isexternalfile,
      };
}

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
