// To parse this JSON data, do
//
//     final postsResponse = postsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:goscele/utils/constants.dart';
import 'package:goscele/utils/custom_functions.dart';
import 'package:hive/hive.dart';

part 'discussion_response.g.dart';

PostsResponse postsResponseFromJson(String str) =>
    PostsResponse.fromJson(json.decode(str));

String postsResponseToJson(PostsResponse data) => json.encode(data.toJson());

class PostsResponse {
  PostsResponse({
    this.posts,
    this.warnings,
  });

  List<Post> posts;
  List<dynamic> warnings;

  factory PostsResponse.fromJson(Map<String, dynamic> json) => PostsResponse(
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        warnings: List<dynamic>.from(json["warnings"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
        "warnings": List<dynamic>.from(warnings.map((x) => x)),
      };
}

@HiveType(typeId: Constants.hiveAdapterDiscussion)
class Post {
  Post({
    this.id,
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
    this.children,
    this.canreply,
    this.postread,
    this.userfullname,
    this.userpictureurl,
  });

  @HiveField(1)
  int id;

  @HiveField(2)
  int discussion;

  @HiveField(3)
  int parent;

  @HiveField(4)
  int userid;

  @HiveField(5)
  int created;

  @HiveField(6)
  int modified;

  @HiveField(7)
  int mailed;

  @HiveField(8)
  String subject;

  @HiveField(9)
  String message;

  @HiveField(10)
  int messageformat;

  @HiveField(11)
  int messagetrust;

  @HiveField(12)
  String attachment;

  @HiveField(13)
  int totalscore;

  @HiveField(14)
  int mailnow;

  @HiveField(15)
  List<int> children;

  @HiveField(16)
  bool canreply;

  @HiveField(17)
  bool postread;

  @HiveField(18)
  String userfullname;

  @HiveField(19)
  String userpictureurl;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
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
        children: List<int>.from(json["children"].map((x) => x)),
        canreply: json["canreply"],
        postread: json["postread"],
        userfullname: json["userfullname"],
        userpictureurl: json["userpictureurl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
        "children": List<dynamic>.from(children.map((x) => x)),
        "canreply": canreply,
        "postread": postread,
        "userfullname": userfullname,
        "userpictureurl": userpictureurl,
      };
}
