// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discussion_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 7;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post(
      id: fields[1] as int,
      discussion: fields[2] as int,
      parent: fields[3] as int,
      userid: fields[4] as int,
      created: fields[5] as int,
      modified: fields[6] as int,
      mailed: fields[7] as int,
      subject: fields[8] as String,
      message: fields[9] as String,
      messageformat: fields[10] as int,
      messagetrust: fields[11] as int,
      attachment: fields[12] as String,
      totalscore: fields[13] as int,
      mailnow: fields[14] as int,
      children: (fields[15] as List)?.cast<int>(),
      canreply: fields[16] as bool,
      postread: fields[17] as bool,
      userfullname: fields[18] as String,
      userpictureurl: fields[19] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(19)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.discussion)
      ..writeByte(3)
      ..write(obj.parent)
      ..writeByte(4)
      ..write(obj.userid)
      ..writeByte(5)
      ..write(obj.created)
      ..writeByte(6)
      ..write(obj.modified)
      ..writeByte(7)
      ..write(obj.mailed)
      ..writeByte(8)
      ..write(obj.subject)
      ..writeByte(9)
      ..write(obj.message)
      ..writeByte(10)
      ..write(obj.messageformat)
      ..writeByte(11)
      ..write(obj.messagetrust)
      ..writeByte(12)
      ..write(obj.attachment)
      ..writeByte(13)
      ..write(obj.totalscore)
      ..writeByte(14)
      ..write(obj.mailnow)
      ..writeByte(15)
      ..write(obj.children)
      ..writeByte(16)
      ..write(obj.canreply)
      ..writeByte(17)
      ..write(obj.postread)
      ..writeByte(18)
      ..write(obj.userfullname)
      ..writeByte(19)
      ..write(obj.userpictureurl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
