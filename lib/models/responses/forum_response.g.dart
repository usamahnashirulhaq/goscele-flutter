// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiscussionAdapter extends TypeAdapter<Discussion> {
  @override
  final int typeId = 3;

  @override
  Discussion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Discussion(
      id: fields[1] as int,
      name: fields[2] as String,
      groupid: fields[3] as int,
      timemodified: fields[4] as int,
      usermodified: fields[5] as int,
      timestart: fields[6] as int,
      timeend: fields[7] as int,
      discussion: fields[8] as int,
      parent: fields[9] as int,
      userid: fields[10] as int,
      created: fields[11] as int,
      modified: fields[12] as int,
      mailed: fields[13] as int,
      subject: fields[14] as String,
      message: fields[15] as String,
      messageformat: fields[16] as int,
      messagetrust: fields[17] as int,
      attachment: fields[18] as String,
      totalscore: fields[19] as int,
      mailnow: fields[20] as int,
      userfullname: fields[21] as String,
      usermodifiedfullname: fields[22] as String,
      userpictureurl: fields[23] as String,
      usermodifiedpictureurl: fields[24] as String,
      numreplies: fields[25] as String,
      numunread: fields[26] as int,
      pinned: fields[27] as bool,
      locked: fields[28] as bool,
      canreply: fields[29] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Discussion obj) {
    writer
      ..writeByte(29)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.groupid)
      ..writeByte(4)
      ..write(obj.timemodified)
      ..writeByte(5)
      ..write(obj.usermodified)
      ..writeByte(6)
      ..write(obj.timestart)
      ..writeByte(7)
      ..write(obj.timeend)
      ..writeByte(8)
      ..write(obj.discussion)
      ..writeByte(9)
      ..write(obj.parent)
      ..writeByte(10)
      ..write(obj.userid)
      ..writeByte(11)
      ..write(obj.created)
      ..writeByte(12)
      ..write(obj.modified)
      ..writeByte(13)
      ..write(obj.mailed)
      ..writeByte(14)
      ..write(obj.subject)
      ..writeByte(15)
      ..write(obj.message)
      ..writeByte(16)
      ..write(obj.messageformat)
      ..writeByte(17)
      ..write(obj.messagetrust)
      ..writeByte(18)
      ..write(obj.attachment)
      ..writeByte(19)
      ..write(obj.totalscore)
      ..writeByte(20)
      ..write(obj.mailnow)
      ..writeByte(21)
      ..write(obj.userfullname)
      ..writeByte(22)
      ..write(obj.usermodifiedfullname)
      ..writeByte(23)
      ..write(obj.userpictureurl)
      ..writeByte(24)
      ..write(obj.usermodifiedpictureurl)
      ..writeByte(25)
      ..write(obj.numreplies)
      ..writeByte(26)
      ..write(obj.numunread)
      ..writeByte(27)
      ..write(obj.pinned)
      ..writeByte(28)
      ..write(obj.locked)
      ..writeByte(29)
      ..write(obj.canreply);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiscussionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AttachmentAdapter extends TypeAdapter<Attachment> {
  @override
  final int typeId = 5;

  @override
  Attachment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Attachment(
      filename: fields[1] as String,
      filepath: fields[2] as String,
      filesize: fields[3] as int,
      fileurl: fields[4] as String,
      timemodified: fields[5] as int,
      mimetype: fields[6] as String,
      isexternalfile: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Attachment obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.filename)
      ..writeByte(2)
      ..write(obj.filepath)
      ..writeByte(3)
      ..write(obj.filesize)
      ..writeByte(4)
      ..write(obj.fileurl)
      ..writeByte(5)
      ..write(obj.timemodified)
      ..writeByte(6)
      ..write(obj.mimetype)
      ..writeByte(7)
      ..write(obj.isexternalfile);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttachmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
